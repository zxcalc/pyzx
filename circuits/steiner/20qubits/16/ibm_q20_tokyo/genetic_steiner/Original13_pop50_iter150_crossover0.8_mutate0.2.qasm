// Initial wiring: [5, 7, 4, 18, 17, 12, 2, 0, 14, 8, 1, 11, 16, 19, 6, 10, 3, 13, 9, 15]
// Resulting wiring: [5, 7, 4, 18, 17, 12, 2, 0, 14, 8, 1, 11, 16, 19, 6, 10, 3, 13, 9, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[5], q[3];
cx q[7], q[1];
cx q[8], q[7];
cx q[11], q[9];
cx q[13], q[12];
cx q[13], q[7];
cx q[14], q[13];
cx q[13], q[12];
cx q[14], q[13];
cx q[15], q[14];
cx q[17], q[12];
cx q[12], q[6];
cx q[6], q[4];
cx q[18], q[12];
cx q[12], q[7];
cx q[12], q[6];
cx q[18], q[12];
cx q[12], q[13];
cx q[8], q[10];
cx q[2], q[3];
