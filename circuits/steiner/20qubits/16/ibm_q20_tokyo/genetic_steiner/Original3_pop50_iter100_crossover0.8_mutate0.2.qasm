// Initial wiring: [3, 13, 14, 5, 1, 0, 16, 8, 4, 9, 17, 19, 6, 18, 11, 15, 7, 10, 2, 12]
// Resulting wiring: [3, 13, 14, 5, 1, 0, 16, 8, 4, 9, 17, 19, 6, 18, 11, 15, 7, 10, 2, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[5], q[3];
cx q[7], q[6];
cx q[8], q[7];
cx q[7], q[6];
cx q[8], q[2];
cx q[8], q[7];
cx q[9], q[8];
cx q[10], q[8];
cx q[11], q[10];
cx q[14], q[13];
cx q[14], q[5];
cx q[15], q[13];
cx q[17], q[18];
cx q[14], q[16];
cx q[8], q[11];
cx q[7], q[12];
cx q[5], q[6];
cx q[1], q[2];
