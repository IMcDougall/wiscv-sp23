use Data::Dumper qw(Dumper);
use Switch;
my $str = "ab, cd";
my @words = split / /, $str;
#print Dumper \@words;

my $arg_list = @ARGV;
my $help = 0;

if($arg_list) {
  foreach my $arg_num (0..$#ARGV)
  {
    if($ARGV[$arg_num] eq "-elf_run_out") {
      $arg_num++;
      $elf_run_out = $ARGV[$arg_num];
    } 
    elsif($ARGV[arg_num] eq "-help") {
      $arg_num++;
      $help = 1; 
    }
  }
}

if($help == 1){
  &print_help();
} elsif($elf_run_out eq "") {
    print "ELF Run Output Path must be provided\n";
}
else {
#  if($elf_run_out ne "") {
    &extract_info_from_instr();
 # }
}


##SUBROUTINES
sub print_help() {
   print "Usage : perl extract_regs.pl [-elf_run_out <Path to ELF Run Output File>]\n";
}

sub extract_info_from_instr() {

print "ELF Run Output Path : $elf_run_out\n";
open(my $elf_run_out_fh, '<' , $elf_run_out) or die "Could not open $elf_run_out\n";
open(my $instr_funct_name_fh, '>' , "instr_funct_name.txt") or die "Could not open instr_funct_name.txt";
open(my $instr_pc_fh, '>' , "instr_pc.txt") or die "Could not open instr_pc.txt";
open(my $instr_name_fh, '>' , "instr_name.txt") or die "Could not open instr_name.txt";
open(my $instr_rd_fh, '>' , "instr_rd.txt") or die "Could not open instr_rd.txt";
open(my $instr_rs1_fh, '>' , "instr_rs1.txt") or die "Could not open instr_rs1.txt";
open(my $instr_rs2_fh, '>' , "instr_rs2.txt") or die "Could not open instr_rs2.txt";
open(my $instr_imm_fh, '>' , "instr_imm.txt") or die "Could not open instr_imm.txt";
open(my $instr_fh, '>' , "instr.txt") or die "Could not open instr.txt";
print "$elf_run_out IN PARSE\n";
my $line = "tmp";
while($line)
{
  #do {
    $line = <$elf_run_out_fh>;
  if($line) {
    #print "$line";
    my @helper = split /\s+ /, $line;
    my @instr_pc_dump = split / /, $helper[1];
    my @instr_pc_dump2 = split /x/, $instr_pc_dump[0];
    my $instr_pc = $instr_pc_dump2[1];
    my $funct_name = $helper[2];
    my $instr_temp = $helper[3];
    my $instr = substr $instr_temp, 1;
    my @instr_extract = split /;/, $instr;
    #print "$instr_extract[0]\n";
    #print "$instr\n";
    #print $instr_temp;
    #print "$instr_pc_dump[0]\n";
    #print "$instr_pc_dump2[1]\n";
    my @instr_dump = split /[,\s;]/, $instr;
    my $instr_name = $instr_dump[0];
    #print "Instruction PC : $instr_pc\n";
    #print "Function Name : $funct_name\n";
    #print "Instruction : $instr";
    #print "Instruction Name : $instr_name\n";

    switch($instr_name) {
    
    case ["lui", "auipc", "jal"] {
                                  #print "$instr\n";
                                  $instr_rd = $instr_dump[1];
                                  $instr_imm = $instr_dump[3];
                                  $instr_rs1 = 0;
                                  $instr_rs2 = 0;
                                  #print "rd : $instr_rd\n";
                                  #print "Imm : $instr_imm\n";
                                 }

    case ["jalr", "addi", "slti", "sltiu", "xori", "ori", "andi", "slli", "srli", "srai"] {
                                                                                                                                       #print "$instr\n";
                                                                                                                                       $instr_rd = $instr_dump[1];
                                                                                                                                       $instr_rs1 = $instr_dump[3];
                                                                                                                                       $instr_imm = $instr_dump[5];
                                                                                                                                       $instr_rs2 = 0;
                                                                                                                                       #print "rd : $instr_rd\n";
                                                                                                                                       #print "rs1 : $instr_rs1\n";
                                                                                                                                       #print "Imm : $instr_imm\n";
                                                                                                                                       }                                                                                       

    case ["beq", "bne", "blt", "bge", "bltu", "bgeu"] {
                                                                                                                                       #print "$instr\n";
                                                                                                                                       $instr_rd = 0;
                                                                                                                                       $instr_rs1 = $instr_dump[1];
                                                                                                                                       $instr_rs2 = $instr_dump[3];
                                                                                                                                       $instr_imm = $instr_dump[5];
                                                                                                                                       #print "rd : $instr_rd\n";
                                                                                                                                       #print "rs1 : $instr_rs1\n";
                                                                                                                                       #print "rs2 : $instr_rs2\n";
                                                                                                                                       #print "Imm : $instr_imm\n";
                                                                                                                                       }  

   case ["add", "sub", "slt", "sltu", "xor", "or", "and", "sll", "srl", "sra"] {
                                                                                                                                       #print "$instr\n";
                                                                                                                                       $instr_rd = $instr_dump[1];
                                                                                                                                       $instr_rs1 = $instr_dump[3];
                                                                                                                                       $instr_rs2 = $instr_dump[5];
                                                                                                                                       $instr_imm = 0;
                                                                                                                                       #print "rd : $instr_rd\n";
                                                                                                                                       #print "rs1 : $instr_rs1\n";
                                                                                                                                       #print "rs2 : $instr_rs2\n";
                                                                                                                                       #print "Imm : $instr_imm\n";
                                                                                                                                       }    

   case ["lb", "lh", "lw", "lbu", "lhu"] {
                                                                                                                                       #print "$instr\n";
                                                                                                                                       $instr_rd = $instr_dump[1];
                                                                                                                                       @instr_rs1_dump = split /[()]/, $instr_dump[3];
                                                                                                                                       $instr_rs1 = $instr_rs1_dump[1];
                                                                                                                                       $instr_rs2 = 0;
                                                                                                                                       $instr_imm = $instr_rs1_dump[0];
                                                                                                                                       #print "rd : $instr_rd\n";
                                                                                                                                       #print "rs1 : $instr_rs1\n";
                                                                                                                                       #print "rs2 : $instr_rs2\n";
                                                                                                                                       #print "Imm : $instr_imm\n";
                                                                                                                                       }     

    case ["sb", "sh", "sw"] {
                                                                                                                                       #print "$instr\n";
                                                                                                                                       $instr_rd = 0;
                                                                                                                                       $instr_rs1 = $instr_dump[1];
                                                                                                                                       @instr_rs2_dump = split /[()]/, $instr_dump[3];
                                                                                                                                       $instr_rs2 = $instr_rs2_dump[1];
                                                                                                                                       $instr_imm = $instr_rs2_dump[0];
                                                                                                                                       #print "rd : $instr_rd\n";
                                                                                                                                       #print "rs1 : $instr_rs1\n";
                                                                                                                                       #print "rs2 : $instr_rs2\n";
                                                                                                                                       #print "Imm : $instr_imm\n";
                                                                                                                                       #print "$instr_dump[2]\n";
                                                                                                                                       #print "$instr_dump[4]\n";
                                                                                                                                       #print "$instr_dump[5]\n";
                                                                                                                                       }

       case ["fence", "fence.i", "ecall", "ebreak"]  {                                                                                        
                                                                                                                                       $instr_rd = 0;
                                                                                                                                       $instr_imm = 0;
                                                                                                                                       $instr_rs1 = 0;
                                                                                                                                       $instr_rs2 = 0;
                                                                                                                                       }

      case ["csrrw", "csrrs", "csrrc"] {                                                                                               #print "$instr\n";
                                                                                                                                       $instr_rd = $instr_dump[1];
                                                                                                                                       $instr_rs1 = $instr_dump[5];
                                                                                                                                       $instr_rs2 = $instr_dump[3];
                                                                                                                                       $instr_imm = 0;
                                                                                                                                       #print "rd : $instr_rd\n";
                                                                                                                                       #print "rs1 : $instr_rs1\n";
                                                                                                                                       #print "rs2 : $instr_rs2\n";
                                                                                                                                       #print "Imm : $instr_imm\n";

                                       }

      case ["csrrwi", "csrrsi", "csrrci"] {                                                                                            #print "$instr\n";
                                                                                                                                       $instr_rd = $instr_dump[1];
                                                                                                                                       $instr_rs1 = 0;
                                                                                                                                       $instr_rs2 = $instr_dump[3];
                                                                                                                                       $instr_imm = $instr_dump[5];
                                                                                                                                       #print "rd : $instr_rd\n";
                                                                                                                                       #print "rs1 : $instr_rs1\n";
                                                                                                                                       #print "rs2 : $instr_rs2\n";
                                                                                                                                       #print "Imm : $instr_imm\n";

                                          }                                                                         

                                  
    }

    my $instr_rd_idx = reg_mapping($instr_rd);
    my $instr_rs1_idx = reg_mapping($instr_rs1);
    my $instr_rs2_idx = reg_mapping($instr_rs2);
    #print "instr rd : $instr_rd , instr rd idx : $instr_rd_idx\n";
    #print "instr rs1 : $instr_rs1 , instr rs1 idx : $instr_rs1_idx\n";
    #print "instr rs2 : $instr_rs2 , instr rs2 idx : $instr_rs2_idx\n";
    my $instr_imm_decimal = 0;
    if(index($instr_imm, "0x") != -1) {
         $instr_imm_decimal = (hex($instr_imm)^0x80000000)-0x80000000;  # converting hex strings to decimal, handling negative numbers too
    } else {
         $instr_imm_decimal = $instr_imm;
    }
    #print "instr imm : $instr_imm, instr imm decimal : $instr_imm_decimal\n";
    print $instr_funct_name_fh "$funct_name\n"; 
    print $instr_pc_fh "$instr_pc\n"; 
    print $instr_name_fh "$instr_name\n"; 
    print $instr_rd_fh "$instr_rd_idx\n"; 
    print $instr_rs1_fh "$instr_rs1_idx\n"; 
    print $instr_rs2_fh "$instr_rs2_idx\n"; 
    print $instr_imm_fh "$instr_imm_decimal\n"; 
    print $instr_fh "$instr_extract[0]\n"; 
  #}
   }

}

}

sub reg_mapping() {
  my $instr_reg_name = shift(@_);

  switch($instr_reg_name) {
        case ["x0", "zero"] { $instr_reg_name_mapped = 0; }
        case ["x1", "ra"] { $instr_reg_name_mapped = 1; }
        case ["x2", "sp"] { $instr_reg_name_mapped = 2; }
        case ["x3", "gp"] { $instr_reg_name_mapped = 3; }
        case ["x4", "tp"] { $instr_reg_name_mapped = 4; }
        case ["x5", "t0"] { $instr_reg_name_mapped = 5; }
        case ["x6", "t1"] { $instr_reg_name_mapped = 6; }
        case ["x7", "t2"] { $instr_reg_name_mapped = 7; }
        case ["x8", "s0", "fp"] { $instr_reg_name_mapped = 8; }
        case ["x8", "s1"] { $instr_reg_name_mapped = 9; }
        case ["x10", "a0"] { $instr_reg_name_mapped = 10; }
        case ["x11", "a1"] { $instr_reg_name_mapped = 11; }
        case ["x12", "a2"] { $instr_reg_name_mapped = 12; }
        case ["x13", "a3"] { $instr_reg_name_mapped = 13; }
        case ["x14", "a4"] { $instr_reg_name_mapped = 14; }
        case ["x15", "a5"] { $instr_reg_name_mapped = 15; }
        case ["x16", "a6"] { $instr_reg_name_mapped = 16; }
        case ["x17", "a7"] { $instr_reg_name_mapped = 17; }
        case ["x18", "s2"] { $instr_reg_name_mapped = 18; }
        case ["x19", "s3"] { $instr_reg_name_mapped = 19; }
        case ["x20", "s4"] { $instr_reg_name_mapped = 20; }
        case ["x21", "s5"] { $instr_reg_name_mapped = 21; }
        case ["x22", "s6"] { $instr_reg_name_mapped = 22; }
        case ["x23", "s7"] { $instr_reg_name_mapped = 23; }
        case ["x24", "s8"] { $instr_reg_name_mapped = 24; }
        case ["x25", "s9"] { $instr_reg_name_mapped = 25; }
        case ["x26", "s10"] { $instr_reg_name_mapped = 26; }
        case ["x27", "s11"] { $instr_reg_name_mapped = 27; }
        case ["x28", "t3"] { $instr_reg_name_mapped = 28; }
        case ["x29", "t4"] { $instr_reg_name_mapped = 29; }
        case ["x30", "t5"] { $instr_reg_name_mapped = 30; }
        case ["x31", "t6"] { $instr_reg_name_mapped = 31; }
        case ["0"] { $instr_reg_name_mapped = 0; }
  }

  return $instr_reg_name_mapped;

} 
