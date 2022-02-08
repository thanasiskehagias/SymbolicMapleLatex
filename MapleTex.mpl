curdir:=currentdir():
qN:=numelems(VARS):
for qn from 1 to qN do 
  VARS1[qn]:=cat("latex(",VARS[qn],")"): 
  VARS2[qn]:=cat("latex(",VARS[qn],",output=string):"):
  parse(VARS1[qn],statement): 
end do;

with(StringTools):
str1:="";
for jn from 1 to 10^10 do
	str2:=readline(fin):
	if str2=0 then 
		break 
	end if:
    q1:=Length(str2):
	q2:=substring(str2,1..2);
	q3:=substring(str2,3..q1);
	if type(str2,string) and q2="##" then
		str1:=cat(str1,"\n",q3):
	end if:
od:
str2:=str1:

#fdout0:=fclose(fout0):
fdout:=fopen(fout,WRITE):
for qn from 1 to qN do str2:=SubstituteAll(str2,VARS1[qn],parse(VARS2[qn],statement)): end do;
writeline(fdout,str2): 
fdout:=fclose(fout);

system(cat("pdflatex ",fn));
