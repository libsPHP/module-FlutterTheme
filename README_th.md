# 🚀 Flutter Magento Plugin 2.0

ไลบรารี Flutter แบบรวมสำหรับการผสานรวมกับแพลตฟอร์ม e-commerce ของ Magento เวอร์ชัน 2.0 ช่วยขจัดการซ้ำซ้อนของโค้ดระหว่างแอปพลิเคชันและมีฟังก์ชันมากกว่า 200 ฟังก์ชันสำหรับการสร้างแอปพลิเคชันมือถือทางการค้าสมัยใหม่

## 📱 ภาพหน้าจอ

<div align="center">
  <img src="screenshots/main.jpg" alt="หน้าหลัก" width="250"/>
  <img src="screenshots/login.jpg" alt="หน้าเข้าสู่ระบบ" width="250"/>
  <img src="screenshots/signup.jpg" alt="หน้าสมัครสมาชิก" width="250"/>
</div>

<div align="center">
  <img src="screenshots/products.jpg" alt="หน้าสินค้า" width="250"/>
  <img src="screenshots/cart.jpg" alt="ตะกร้าสินค้า" width="250"/>
  <img src="screenshots/settings.jpg" alt="การตั้งค่า" width="250"/>
</div>

## ✨ ฟีเจอร์ใหม่ในเวอร์ชัน 2.0

### 🎯 **สถาปัตยกรรมแบบรวม**
- **ขจัดความซ้ำซ้อน**: API เดียวสำหรับทุกแอปพลิเคชัน
- **โครงสร้างแบบโมดูล**: ใช้เฉพาะคอมโพเนนต์ที่ต้องการ
- **ความปลอดภัยของประเภท**: การพิมพ์แบบเข้มงวดด้วยโมเดล Freezed
- **ความสอดคล้อง**: วิธีการเดียวกันในทุกแอปพลิเคชัน

### 🔐 **การรับรองตัวตนขั้นสูง**
- โทเค็น JWT พร้อมการรีเฟรชอัตโนมัติ
- การจัดเก็บที่ปลอดภัยด้วย FlutterSecureStorage
- รองรับ "จดจำฉัน"
- การตรวจสอบโทเค็นอัตโนมัติ
- การจัดการการหมดอายุของเซสชัน

### 🌐 **เลเยอร์เครือข่ายแบบรวม**
- Dio + HTTP client พร้อมการลองใหม่อัตโนมัติ
- การตรวจสอบการเชื่อมต่ออินเทอร์เน็ต
- การจัดการข้อผิดพลาดอัตโนมัติ
- การบันทึกคำขอในโหมดดีบัก
- การแคชการตอบสนอง

### 🌍 **ระบบการแปลภาษา**
- **ภาษามากกว่า 45 ภาษา** พร้อมใช้งาน
- การตรวจจับภาษาของระบบอัตโนมัติ
- รองรับพหูพจน์
- รองรับ RTL สำหรับภาษาอาหรับและฮิบรู
- การแปลแบบกำหนดเอง

### 📱 **โหมดออฟไลน์**
- การแคชข้อมูลอัตโนมัติ
- คิวการดำเนินการสำหรับโหมดออฟไลน์
- SQLite + Hive สำหรับการเข้าถึงอย่างรวดเร็ว
- การซิงค์อัตโนมัติเมื่อเครือข่ายกลับมา
- กลยุทธ์การแคชที่กำหนดได้

### 🎨 **การจัดการสถานะ**
- รูปแบบ Provider + ChangeNotifier
- ผู้ให้บริการพร้อมใช้สำหรับทุกบริการ
- การอัปเดต UI แบบรีแอคทีฟ
- การจัดการสถานะแบบรวมศูนย์

### 🛍️ **ฟังก์ชันการค้าอิเล็กทรอนิกส์ขั้นสูง**
- การผสานรวม Magento REST API แบบเต็มรูปแบบ
- รองรับ GraphQL สำหรับการสืบค้นที่ซับซ้อน
- ตะกร้าพร้อมรองรับผู้ใช้แขก
- รายการปรารถนาพร้อมรายการหลายรายการ
- การค้นหาและการกรองขั้นสูง

## 🚀 เริ่มต้นใช้งาน

### การติดตั้ง

เพิ่มการพึ่งพาในไฟล์ `pubspec.yaml` ของคุณ:

```yaml
dependencies:
  flutter_magento: ^2.0.0
```

### เริ่มต้นอย่างรวดเร็ว

```dart
import 'package:flutter_magento/flutter_magento.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MagentoProvider()),
        ChangeNotifierProxyProvider<MagentoProvider, AuthProvider>(
          create: (context) => AuthProvider(context.read<MagentoProvider>().auth),
          update: (context, magentoProvider, previous) => 
              previous ?? AuthProvider(magentoProvider.auth),
        ),
      ],
      child: MyApp(),
    ),
  );
}
```

## 📱 รองรับแพลตฟอร์ม

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 🔒 ฟีเจอร์ความปลอดภัย

- การรับรองตัวตนด้วยโทเค็น JWT
- การบังคับใช้ HTTPS
- การตรวจสอบและทำความสะอาดข้อมูลนำเข้า
- การจัดเก็บโทเค็นที่ปลอดภัย
- รองรับการจำกัดอัตรา
- การป้องกัน CSRF

## 📊 ฟีเจอร์ประสิทธิภาพ

- การแคชคำขอ
- การเพิ่มประสิทธิภาพรูปภาพ
- รองรับการโหลดแบบ lazy
- โหมดออฟไลน์
- การซิงค์เบื้องหลัง
- การจัดการหน่วยความจำ

## 🌍 การแปลภาษา

README นี้มีให้ในหลายภาษา:
- [English](README.md)
- [Русский](README_ru.md)
- [ไทย](README_th.md) (ปัจจุบัน)
- [中文](README_cn.md)

## 🤝 การมีส่วนร่วม

1. Fork repository
2. สร้างบรานช์ฟีเจอร์
3. ทำการเปลี่ยนแปลง
4. เพิ่มการทดสอบ
5. ส่ง pull request

## 📄 ลิขสิทธิ์

โปรเจ็กต์นี้ได้รับอนุญาตภายใต้ใบอนุญาต MIT - ดูไฟล์ [LICENSE](LICENSE) สำหรับรายละเอียด

## 🆘 การสนับสนุน

- 📧 อีเมล: support@nativemind.net
- 🐛 ปัญหา: [GitHub Issues](https://github.com/nativemind/flutter_magento/issues)
- 📚 เอกสาร: [Wiki](https://github.com/nativemind/flutter_magento/wiki)
- 💬 ชุมชน: [Discord](https://discord.gg/nativemind)

## 🙏 กิตติกรรมประกาศ

- ทีม Magento สำหรับแพลตฟอร์ม e-commerce ที่ยอดเยี่ยม
- ทีม Flutter สำหรับเฟรมเวิร์กที่น่าทึ่ง
- ทีม ScandiPWA สำหรับแรงบันดาลใจและแนวทางปฏิบัติที่ดี
- ผู้มีส่วนร่วมและสมาชิกชุมชนทั้งหมด

---

**สร้างด้วย ❤️ โดยทีม NativeMind**