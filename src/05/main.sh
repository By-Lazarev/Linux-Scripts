#!/bin/sh
start=`date +%s`
#--- CHECK ARGUMENTS GIVEN TO THE SCRIPT ---
if [ $# == "1" ]
then
    dir=$1
    check=`echo "${dir: -1}"`
    if [ $check == "/" ]
    then
        if [ -d "$dir" ]
        then
            STAT="OK"
        else
            echo "Dir not exist"
        fi
    else
        echo "Wrong pattern, template: ./main.sh /var/log/"
    fi
else
    echo "Wrong agruments, only one allowed"
fi

if [ "$STAT" != "OK" ]
then
    exit
fi
#--- NOW THE MAIN PART ---

total=`find $dir -type d | grep -v "[\.$]" | wc -l`

## --- Part info for TOP 5 folders ---
foldFstPath=`du -hs $dir* | sort -rn | head -5 | awk '{print$2}' | head -1 | tail -1`
foldSndPath=`du -hs $dir* | sort -rn | head -5 | awk '{print$2}' | head -2 | tail -1`
foldTrdPath=`du -hs $dir* | sort -rn | head -5 | awk '{print$2}' | head -3 | tail -1`
foldFthPath=`du -hs $dir* | sort -rn | head -5 | awk '{print$2}' | head -4 | tail -1`
foldFivPath=`du -hs $dir* | sort -rn | head -5 | awk '{print$2}' | head -5 | tail -1`
foldFstSize=`du -hs $dir* | sort -rn | head -5 | awk '{print$1}' | head -1 | tail -1`
foldSndSize=`du -hs $dir* | sort -rn | head -5 | awk '{print$1}' | head -2 | tail -1`
foldTrdSize=`du -hs $dir* | sort -rn | head -5 | awk '{print$1}' | head -3 | tail -1`
foldFthSize=`du -hs $dir* | sort -rn | head -5 | awk '{print$1}' | head -4 | tail -1`
foldFivSize=`du -hs $dir* | sort -rn | head -5 | awk '{print$1}' | head -5 | tail -1`
## --- END OF PART TOP 5 folders ---

totalFiles=`find $dir -type f | wc -l`
totalConf=`find $dir -type f | grep "[*\.conf$]" | wc -l`
totalText=`find $dir -type f | grep "[*\.txt$]" | wc -l`
totalExec=`find $dir -executable -type f | wc -l`
totalLog=`find $dir -type f | grep "[*\.log$]" | wc -l`
totalArch=`find $dir -type f | grep "[(*\.zip$|*\.7z$)]" | wc -l`
totalSymb=`find $dir -type l | wc -l`

## --- TOP 10 files ---
tenFstPath=`du /var/ -a -h | sort -rn | grep "[\.*$]" | head -1 | tail -1 | awk '{print$2}'`
tenSndPath=`du /var/ -a -h | sort -rn | grep "[\.*$]" | head -2 | tail -1 | awk '{print$2}'`
tenTrdPath=`du /var/ -a -h | sort -rn | grep "[\.*$]" | head -3 | tail -1 | awk '{print$2}'`
tenFthPath=`du /var/ -a -h | sort -rn | grep "[\.*$]" | head -4 | tail -1 | awk '{print$2}'`
tenFivPath=`du /var/ -a -h | sort -rn | grep "[\.*$]" | head -5 | tail -1 | awk '{print$2}'`
tenSthPath=`du /var/ -a -h | sort -rn | grep "[\.*$]" | head -6 | tail -1 | awk '{print$2}'`
tenSevPath=`du /var/ -a -h | sort -rn | grep "[\.*$]" | head -7 | tail -1 | awk '{print$2}'`
tenEthPath=`du /var/ -a -h | sort -rn | grep "[\.*$]" | head -8 | tail -1 | awk '{print$2}'`
tenNthPath=`du /var/ -a -h | sort -rn | grep "[\.*$]" | head -9 | tail -1 | awk '{print$2}'`
tenTthPath=`du /var/ -a -h | sort -rn | grep "[\.*$]" | head -10 | tail -1 | awk '{print$2}'`
tenFstSize=`du /var/ -a -h | sort -rn | grep "[\.*$]" | head -1 | tail -1 | awk '{print$1}'`
tenSndSize=`du /var/ -a -h | sort -rn | grep "[\.*$]" | head -2 | tail -1 | awk '{print$1}'`
tenTrdSize=`du /var/ -a -h | sort -rn | grep "[\.*$]" | head -3 | tail -1 | awk '{print$1}'`
tenFthSize=`du /var/ -a -h | sort -rn | grep "[\.*$]" | head -4 | tail -1 | awk '{print$1}'`
tenFivSize=`du /var/ -a -h | sort -rn | grep "[\.*$]" | head -5 | tail -1 | awk '{print$1}'`
tenSthSize=`du /var/ -a -h | sort -rn | grep "[\.*$]" | head -6 | tail -1 | awk '{print$1}'`
tenSevSize=`du /var/ -a -h | sort -rn | grep "[\.*$]" | head -7 | tail -1 | awk '{print$1}'`
tenEthSize=`du /var/ -a -h | sort -rn | grep "[\.*$]" | head -8 | tail -1 | awk '{print$1}'`
tenNthSize=`du /var/ -a -h | sort -rn | grep "[\.*$]" | head -9 | tail -1 | awk '{print$1}'`
tenTthSize=`du /var/ -a -h | sort -rn | grep "[\.*$]" | head -10 | tail -1 | awk '{print$1}'`
tenFstType=`du /var/ -a -h | sort -rn | grep "[\.*$]" | head -1 | tail -1 | awk '{print$2}' | grep "[\.*$]"`
tenSndType=`du /var/ -a -h | sort -rn | grep "[\.*$]" | head -2 | tail -1 | awk '{print$2}' | grep "[\.*$]"`
tenTrdType=`du /var/ -a -h | sort -rn | grep "[\.*$]" | head -3 | tail -1 | awk '{print$2}' | grep "[\.*$]"`
tenFthType=`du /var/ -a -h | sort -rn | grep "[\.*$]" | head -4 | tail -1 | awk '{print$2}' | grep "[\.*$]"`
tenFivType=`du /var/ -a -h | sort -rn | grep "[\.*$]" | head -5 | tail -1 | awk '{print$2}' | grep "[\.*$]"`
tenSthType=`du /var/ -a -h | sort -rn | grep "[\.*$]" | head -6 | tail -1 | awk '{print$2}' | grep "[\.*$]"`
tenSevType=`du /var/ -a -h | sort -rn | grep "[\.*$]" | head -7 | tail -1 | awk '{print$2}' | grep "[\.*$]"`
tenEthType=`du /var/ -a -h | sort -rn | grep "[\.*$]" | head -8 | tail -1 | awk '{print$2}' | grep "[\.*$]"`
tenNthType=`du /var/ -a -h | sort -rn | grep "[\.*$]" | head -9 | tail -1 | awk '{print$2}' | grep "[\.*$]"`
tenTthType=`du /var/ -a -h | sort -rn | grep "[\.*$]" | head -10 | tail -1 | awk '{print$2}' | grep "[\.*$]"`
## --- EOP 10 files ---

## --- TOP 10 .exe ---
execFstPath=`find $dir -type f -exec du -hB M {} + | sort -rn | head -1 | tail -1 | awk '{print$2}'`
execSndPath=`find $dir -type f -exec du -hB M {} + | sort -rn | head -2 | tail -1 | awk '{print$2}'`
execTrdPath=`find $dir -type f -exec du -hB M {} + | sort -rn | head -3 | tail -1 | awk '{print$2}'`
execFthPath=`find $dir -type f -exec du -hB M {} + | sort -rn | head -4 | tail -1 | awk '{print$2}'`
execFivPath=`find $dir -type f -exec du -hB M {} + | sort -rn | head -5 | tail -1 | awk '{print$2}'`
execSthPath=`find $dir -type f -exec du -hB M {} + | sort -rn | head -6 | tail -1 | awk '{print$2}'`
execSevPath=`find $dir -type f -exec du -hB M {} + | sort -rn | head -7 | tail -1 | awk '{print$2}'`
execEthPath=`find $dir -type f -exec du -hB M {} + | sort -rn | head -8 | tail -1 | awk '{print$2}'`
execNthPath=`find $dir -type f -exec du -hB M {} + | sort -rn | head -9 | tail -1 | awk '{print$2}'`
execTthPath=`find $dir -type f -exec du -hB M {} + | sort -rn | head -10 | tail -1 | awk '{print$2}'`

execFstSize=`find $dir -type f -exec du -hB M {} + | sort -rn | head -1 | tail -1 | awk '{print$1}'`
execSndSize=`find $dir -type f -exec du -hB M {} + | sort -rn | head -2 | tail -1 | awk '{print$1}'`
execTrdSize=`find $dir -type f -exec du -hB M {} + | sort -rn | head -3 | tail -1 | awk '{print$1}'`
execFthSize=`find $dir -type f -exec du -hB M {} + | sort -rn | head -4 | tail -1 | awk '{print$1}'`
execFivSize=`find $dir -type f -exec du -hB M {} + | sort -rn | head -5 | tail -1 | awk '{print$1}'`
execSthSize=`find $dir -type f -exec du -hB M {} + | sort -rn | head -6 | tail -1 | awk '{print$1}'`
execSevSize=`find $dir -type f -exec du -hB M {} + | sort -rn | head -7 | tail -1 | awk '{print$1}'`
execEthSize=`find $dir -type f -exec du -hB M {} + | sort -rn | head -8 | tail -1 | awk '{print$1}'`
execNthSize=`find $dir -type f -exec du -hB M {} + | sort -rn | head -9 | tail -1 | awk '{print$1}'`
execTthSize=`find $dir -type f -exec du -hB M {} + | sort -rn | head -10 | tail -1 | awk '{print$1}'`

execFstMd=`md5sum $execFstPath | awk '{print$1}'`
execSndMd=`md5sum $execSndPath | awk '{print$1}'`
execTrdMd=`md5sum $execTrdPath | awk '{print$1}'`
execFthMd=`md5sum $execFthPath | awk '{print$1}'`
execFivMd=`md5sum $execFivPath | awk '{print$1}'`
execSthMd=`md5sum $execSthPath | awk '{print$1}'`
execSevMd=`md5sum $execSevPath | awk '{print$1}'`
execEthMd=`md5sum $execEthPath | awk '{print$1}'`
execNthMd=`md5sum $execNthPath | awk '{print$1}'`
execTthMd=`md5sum $execTthPath | awk '{print$1}'`
## --- EOP 10 .exe ---

clear
echo "Total number of folders (including all nested ones) = $total"
echo "TOP 5 folders of Maximum size arranged in descending order (path and size):"
echo "1 - $foldFstPath, $foldFstSize"
echo "2 - $foldSndPath, $foldSndSize"
echo "3 - $foldTrdPath, $foldTrdSize"
echo "4 - $foldFthPath, $foldFthSize"
echo "5 - $foldFivPath, $foldFivSize"
echo "Total number of files = $totalFiles"
echo "Number of:"
echo "Configuration files (with .conf extension) = $totalConf"
echo "Text files = $totalText"
echo "Executable files = $totalExec"
echo "Log files (with the extension .log) = $totalLog"
echo "Archive files = $totalArch"
echo "Symbolic links = $totalSymb"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
echo "1 - $tenFstPath, $tenFstSize, $tenFstType"
echo "2 - $tenSndPath, $tenSndSize, $tenSndType"
echo "3 - $tenTrdPath, $tenTrdSize, $tenTrdType"
echo "4 - $tenFthPath, $tenFthSize, $tenFthType"
echo "5 - $tenFivPath, $tenFivSize, $tenFivType"
echo "6 - $tenSthPath, $tenSthSize, $tenSthType"
echo "7 - $tenSevPath, $tenSevSize, $tenSevType"
echo "8 - $tenEthPath, $tenEthSize, $tenEthType"
echo "9 - $tenNthPath, $tenNthSize, $tenNthType"
echo "10 - $tenTthPath, $tenTthSize, $tenTthType"
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)"
echo "1 - $execFstPath, $execFstSize, $execFstMd"
echo "2 - $execSndPath, $execSndSize, $execSndMd"
echo "3 - $execTrdPath, $execTrdSize, $execTrdMd"
echo "4 - $execFthPath, $execFthSize, $execFthMd"
echo "5 - $execFivPath, $execFivSize, $execFivMd"
echo "6 - $execSthPath, $execSthSize, $execSthMd"
echo "7 - $execSevPath, $execSevSize, $execSevMd"
echo "8 - $execEthPath, $execEthSize, $execEthMd"
echo "9 - $execNthPath, $execNthSize, $execNthMd"
echo "10 - $execTthPath, $execTthSize, $execTthMd"
end=`date +%s`
runtime=$( echo "$end - $start" | bc -l )
echo "Script execution time (in seconds) = $runtime"
