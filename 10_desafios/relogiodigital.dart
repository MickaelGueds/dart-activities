import 'dart:async';
import 'dart:io';

void main() {
  print('🕒 Relógio Digital Simples');

  Timer.periodic(Duration(seconds: 1), (timer) {
    DateTime agora = DateTime.now();
    String horaFormatada = '${agora.hour.toString().padLeft(2, '0')}:${agora.minute.toString().padLeft(2, '0')}:${agora.second.toString().padLeft(2, '0')}';
    
    stdout.write('\r⏰ Hora Atual: $horaFormatada'); // Atualiza sem quebrar linha
  });
}
    