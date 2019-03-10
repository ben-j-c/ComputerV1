import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Scanner;
/**
 * Why didn't I just use C?
 * @author Ben
 *
 */
public class Assembler 
{
	public static HashMap<String, String> opcode = new HashMap<String, String>();
	public static HashMap<String, String> reg = new HashMap<String, String>();
	public static HashMap<String, Boolean> imm = new HashMap<String, Boolean>();
	public static HashMap<String, Boolean> src = new HashMap<String, Boolean>();
	public static HashMap<String, Boolean> dst = new HashMap<String, Boolean>();
	public static HashMap<String, Integer> labels = new HashMap<String, Integer>();
	
	public static int lineNum = 0;
	
	public static void main (String[] args) throws IOException
	{
		File f = null;
		if(args.length > 0)
			f = new File(args[0]);
		
		if(f == null || !f.exists())
		{
			System.out.println("Please pass a valid file");
			return;
		}
		
		System.out.println("Assembling file...");
		loadOpcodeTable();
		loadReg();
		File merged = mergeFiles(f);
		
		if(args.length > 1)
			assemble(merged, args[1]);
		else
			assemble(merged, "a");
	}
	
	private static void preprocessFile(PrintStream ps, File include) throws IOException
	{
		if(!include.exists())
			System.err.println("Included file " + include.getName() + " does not exist!");
		
		Scanner s = new Scanner(include);
		
		while(s.hasNextLine())
		{
			
			String line = s.nextLine();
			String[] words = line.trim().split(" ");
			
			if(words[0].toLowerCase().startsWith(".include"))
			{
				File toInclude = new File(words[1]);
				preprocessFile(ps, toInclude);
			}
			else if(words[0].toLowerCase().startsWith(".data"))
			{
				File data = new File(words[1]);
				assembleData(data);
			}
			else if(words[0].toLowerCase().startsWith(".define"))
			{
				String key = words[1];
				String meaning = words[2];
				int value = 0;
				if(meaning.startsWith("0x") || meaning.startsWith("0h"))
					value = Integer.parseInt(meaning.substring(2), 16);
				else if(meaning.startsWith("'"))
					value = line.trim().split(" ")[2].charAt(1);
				else if(meaning.startsWith("0b"))
					value = Integer.parseInt(meaning.substring(2));
				else
					value = Integer.parseInt(meaning, 10);
				labels.put(key, value);
			}
			else
			{
				ps.println(line);
			}
		}
		
		s.close();
	}
	
	private static File mergeFiles(File f) throws IOException
	{
		File merge = new File("merged");
		PrintStream ps = null;
		Scanner s = null;
		try
		{
			s = new Scanner(f);
			merge.createNewFile();
			ps = new PrintStream(merge);
		}
		catch (FileNotFoundException e)
		{
			System.out.println("Please pass a valid file");
			e.printStackTrace();
		}
		catch (IOException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.exit(1);
		}
		
		preprocessFile(ps, f);
		
		s.close();
		return merge;
	}
	
	private static void assembleData(File data) throws IOException
	{
		File hex = new File("dataSegment.hex");
		File merged = new File("mergedData");
		hex.createNewFile();
		merged.createNewFile();
		PrintStream ps = new PrintStream(hex);
		PrintStream ms = new PrintStream(merged);
		Scanner s = new Scanner(data);
		
		int address = 0;
		
		while(s.hasNextLine())
		{
			String line = s.nextLine().trim();
			
			if(line.toLowerCase().startsWith(".include"))
			{
				String[] lineData = line.split(" ");
				Scanner sInclude = new Scanner(new File(lineData[1]));
				while(sInclude.hasNextLine())
				{	
					ms.println(sInclude.nextLine());
				}
				
				sInclude.close();
			}
			else
			{
				ms.println(line);
			}
		}
		
		ms.close();
		s.close();
		s = new Scanner(merged);
		while(s.hasNextLine())
		{
			String line = s.nextLine().trim();
			
			if(line.toLowerCase().startsWith(".include"))
			{
				String[] lineData = line.split(" ");
				Scanner sInclude = new Scanner(lineData[1]);
				while(sInclude.hasNextLine())
				{
					
					ps.println(sInclude.nextLine());
				}
				
				sInclude.close();
			}
			else if(line.toLowerCase().startsWith("string") && line.matches(".*\".+\" +0x[0-F]+")) //string "Hello world" 0xABCD
			{
				String[] lineData = line.split("\"");
				
				//grab the 0xABCD and only look at ABCD to parse as a 16-bit int
				char colour = (char) Integer.parseInt(lineData[2].trim().substring(2), 16);
				
				for(int i = 0 ; i < lineData[1].length() ; i++ )
				{
					char cur = lineData[1].charAt(i);
					int check = -(colour + cur + 0x02 + ((address >> 8)&0xFF) + (address&0xFF)); 
					
					System.out.printf(":02 %04X 00 %04X %02X\n", address, (colour << 8) | cur,  ((int) check)&0xFF);
					ps.printf(":02%04X00%04X%02X\n", address, (colour << 8) | cur,  check&0xFF);
					address++;
				}
				
				{
					int check = -(0x02 + ((address >> 8)&0xFF) + (address&0xFF));
					System.out.printf(":02 %04X 00 %04X %02X\n", address, 0,  ((int) check)&0xFF);
					ps.printf(":02%04X00%04X%02X\n", address, 0, check&0xFF);
					address++;
				}
			}
			else if(line.endsWith(":"))
			{
				labels.put(line.split(":")[0], address);
			}
			else if(line.startsWith("word")) 
			{
				String[] lineData = line.split(" ");
				
				{
					int value = 0;
					if(lineData[1].startsWith("0x") || lineData[1].startsWith("0h"))
						value = Integer.parseInt(lineData[1].substring(2), 16);
					else if(lineData[1].startsWith("'"))
						value = lineData[1].charAt(1);
					else if(lineData[1].startsWith("0b"))
						value = Integer.parseInt(lineData[1].substring(2));
					else
						value = Integer.parseInt(lineData[1], 10);
					
					int check = -(((value >> 8)&0xFF) + (value&0xFF) + 0x02 + ((address >> 8)&0xFF) + (address&0xFF)); 
					
					System.out.printf(":02 %04X 00 %04X %02X\n", address, value,  ((int) check)&0xFF);
					ps.printf(":02%04X00%04X%02X\n", address, value, check&0xFF);
					address++;
				}
			}
		}
		ps.println(":00000001FF");
		s.close();
		ps.close();
	}
	
	public static void loadOpcodeTable() throws FileNotFoundException
	{
		File table = new File("OpcodeTable");
		Scanner s = new Scanner(table);
		while(s.hasNext())
		{
			String opc = s.next();
			opcode.put(opc,s.next().trim());
			dst.put(opc, s.nextBoolean());
			src.put(opc, s.nextBoolean());
			imm.put(opc, s.nextBoolean());
		}
		
		s.close();
	}
	
	public static void loadReg() throws FileNotFoundException
	{
		File table = new File("regNames");
		Scanner s = new Scanner(table);
		while(s.hasNext())
		{
			String register = s.next();
			reg.put(register, s.next());
		}
		s.close();
	}
	
	public static void findLabels(File input)
	{
		Scanner s = null;
		try
		{
			s = new Scanner(input);
		} catch (FileNotFoundException e)
		{
			e.printStackTrace();
			
			System.exit(1);
		}
		
		
		int address = 0;
		while(s.hasNextLine())
		{
			String line = s.nextLine().trim();
			
			if(line.contains(";"))
				address++;
			else if(line.contains(":"))
			{
				labels.put(line.substring(0, line.indexOf(":")), address);
			}
		}
	}
	
	public static void assemble(File input, String outName)
	{
		File output = new File(outName + ".hex");
		
		if (output.exists())
		{
			System.out.printf("Output file \"%s\" exists; replace it? (y/n)", outName + ".hexs");
			Scanner s = new Scanner(System.in);
			if(s.nextLine().toLowerCase().equals("y"))
				output.delete();
			s.close();
		}
		
		
		Scanner s = null;
		try
		{
			s = new Scanner(input);
		} catch (FileNotFoundException e)
		{
			e.printStackTrace();
			
			System.exit(1);
		}
		
		PrintStream out = null;
		try {
			out = new PrintStream(output);
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.exit(1);
		}
		
		findLabels(input);
		
		System.out.println(labels);
		
		
		int address = 0;
		while(s.hasNextLine())
		{
			lineNum++;
			String line = s.nextLine().trim();
			
			System.out.printf("%-30s:\t", line);
			
			if(line.contains(";"))
			{
				String[] instr = line.split("[ ,;]+");
				
				String opc = instr[0].trim().toLowerCase();
				
				if(!opcode.containsKey(opc))
				{
					System.out.println("Unexpected operation on line " + lineNum);
					System.exit(2);
				}
				
				boolean isDst = dst.get(opc);
				boolean isSrc = src.get(opc);
				boolean isImm = imm.get(opc);
				
				int argIdx = 1;
				String opc_bits = opcode.get(opc);
				String dst_bits = "0000";
				String src_bits = "0000";
				String imm_bits = "0000000000000000";
				
				
				if(isDst)
				{
					String operand = instr[argIdx].trim().toLowerCase(); 
					dst_bits = parseDst(operand);
					argIdx++;
				}
				if(isSrc)
				{
					String operand = instr[argIdx].trim().toLowerCase();
					src_bits = parseSrc(operand);
					argIdx++;
				}
				if(isImm)
				{
					String operand = instr[argIdx].trim(); 
					imm_bits = parseImm(operand);
					argIdx++;
				}
				
				String bit_instr = imm_bits + "00" + src_bits + dst_bits + opc_bits;
				
				System.out.println(bit_instr);
				
				long instruction = Long.parseLong(bit_instr, 2);
				int check = (0x04 + address&0xFF + (address >> 8)&0xFF);
				
				for(int i = 24; i >= 0 ;i -= 8)
				{
					check += (int) ((instruction >> i)&0xFF);
				}
				//System.out.println("check:" + check);
				
				String toFile = String.format(":04%04X00%08X", address, instruction);
				
				out.printf("%s%02X\n", toFile, (-check)&0xFF);
				
				address++;
			}
			else
				System.out.println();
			
		}
		
		out.println(":00000001FF");
		out.close();
		s.close();
	}
	
	private static String parseDst(String operand)
	{
		String dst_bits = "";
		try
		{
			if(operand.startsWith("0x"))
				dst_bits = Integer.toBinaryString(Integer.parseInt(operand.substring(2), 16));
			else if(operand.startsWith("0b"))
				dst_bits = operand.substring(2);
			else
				dst_bits = reg.get(operand);
		}
		catch(NullPointerException e)
		{
			System.out.println("Unexpected dst register on line " + lineNum);
			System.exit(3);
		}
		if(dst_bits == null) {
			System.out.println("null bits");
		}
			
		
		if(dst_bits.length() > 4)
			dst_bits = dst_bits.substring(dst_bits.length() - 4);
		else if(dst_bits.length() < 4)
			dst_bits = "0000".substring(dst_bits.length()) + dst_bits;
		
		return dst_bits;
	}
	
	private static String parseSrc(String operand)
	{
		
		String src_bits = "";
		try
		{
			if(operand.startsWith("0x"))
				src_bits = Integer.toBinaryString(Integer.parseInt(operand.substring(2), 16));
			else if(operand.startsWith("0b"))
				src_bits = operand.substring(2);
			else
				src_bits = reg.get(operand);
		}
		catch(NullPointerException e)
		{
			System.out.println("Unexpected src register on line " + lineNum);
			System.exit(4);
		}
		
		if(src_bits.length() > 4)
			src_bits = src_bits.substring(src_bits.length() - 4);
		else if(src_bits.length() < 4)
			src_bits = "0000".substring(src_bits.length()) + src_bits;
		
		return src_bits;
	}
	
	private static String parseImm(String operand)
	{
		String imm_bits = "";
		
		try
		{
			if(operand.startsWith("0x") || operand.startsWith("0h"))
				imm_bits = Integer.toBinaryString(Integer.parseInt(operand.substring(2), 16));
			else if(operand.startsWith("'"))
				imm_bits = Integer.toBinaryString(operand.charAt(1));
			else if(operand.startsWith("0b"))
				imm_bits = operand.substring(2);
			else if(operand.matches("[A-z]([A-z]*[0-9]*)*"))
				imm_bits = Integer.toBinaryString(labels.get(operand));
			else
				imm_bits = Integer.toBinaryString(Integer.parseInt(operand));
			
		}
		catch(NullPointerException e)
		{
			System.out.println("Unexpected imm on line " + lineNum);
			System.exit(5);
		}
		
		
		if(imm_bits.length() > 16)
			imm_bits = imm_bits.substring(imm_bits.length() - 16);
		else if(imm_bits.length() < 16)
			imm_bits = "0000000000000000".substring(imm_bits.length()) + imm_bits;
		
		
		return imm_bits;
	}
}
