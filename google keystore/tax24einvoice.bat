set path=C:\Program Files\Java\jdk1.8.0_251\bin

cd "D:\mobile\mtax24_ionic4\New folder\bannhap\tax24-mobile\platforms\android\app\release"

jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore tax24einvoice.keystore -storepass Seatech123@ -keypass Seatech123@ android-release-unsigned.apk tax24einvoice

cd D:\mobile\mtax24_ionic4\New folder\bannhap\tax24-mobile\platforms\android\app\release\Tools
zipalign -v 4 "D:\mobile\mtax24_ionic4\New folder\bannhap\tax24-mobile\platforms\android\app\release\app-release.apk" "D:\mobile\mtax24_ionic4\New folder\bannhap\tax24-mobile\platforms\android\app\release\app-release.apk"

pause