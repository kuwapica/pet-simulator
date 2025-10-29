import 'dart:io';
import 'dart:math';
import 'package:pet_simulator/pet_simulator.dart';

void main() {
  print('==== Mini Pet Simulator ====');
  stdout.write('Masukkan nama hewan peliharaanmu: ');
  String? petName = stdin.readLineSync();

  if (petName == null || petName.isEmpty) petName = 'Abdul';

  Pet pet = Pet(petName);
  print('Hai $petName siap menemanimu!');

  bool playing = true;
  Random random = Random();

  while (playing && pet.isAlive()) {
    pet.showStatus();
    print('Apa yang ingin kamu lakukan?');
    print('1. Beri makan');
    print('2. Ajak main');
    print('3. Tidurkan');
    print('4. Selesai');

    stdout.write('Pilih (1-4): ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        pet.feed();
        break;
      case '2':
        pet.play();
        break;
      case '3':
        pet.sleep();
        break;
      case '4':
        print(
          'Terima kasih telah bermain bersama ${pet.name}. Sampai jumpa lain waktu!',
        );
        playing = false;
        break;
      default:
        print('Pilihan tidak valid.');
        continue;
    }
    if (random.nextDouble() < 0.3) {
      int eventType = random.nextInt(3);
      switch (eventType) {
        case 0:
          print('Oh tidak, ${pet.name} sepertinya sakit 😿');
          pet.happines -= 1;
          break;
        case 1:
          print(
            '${pet.name} menemukan teman baru di taman dan dia tampak begitu senang!',
          );
          pet.happines += 2;
          if (pet.happines > 100) pet.happines = 100;
          break;
        case 2:
          print(
            '\ ${pet.name} bermimpi lucu saat tidur, tapi lapar setelah bangun!',
          );
          pet.hunger -= 1;
          if (pet.hunger > 100) pet.hunger = 100;
          break;
      }
    }

    sleep(Duration(seconds: 1));
  }
  print('\nGame selesai.');
}
