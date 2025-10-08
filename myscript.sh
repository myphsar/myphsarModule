# Navigate to your target folder
cd /Users/sak/Desktop/repo/io/github/myphsar/flutter_release/1.0.2

# Sign all .jar files
for file in *.jar; do
    gpg -ab "$file"
done

# Sign all .pom files
for file in *.pom; do
    gpg -ab "$file"
done
# Sign all .jar files
for file in *.md5; do
    gpg -ab "$file"
done
# Sign all .jar files
for file in *.sha1; do
    gpg -ab "$file"
done
 # Sign all .jar files
 for file in *.sha256; do
     gpg -ab "$file"
 done
 # Sign all .jar files
 for file in *.sha512; do
     gpg -ab "$file"
 done
 # Sign all .jar files
 for file in *.module; do
     gpg -ab "$file"
 done
