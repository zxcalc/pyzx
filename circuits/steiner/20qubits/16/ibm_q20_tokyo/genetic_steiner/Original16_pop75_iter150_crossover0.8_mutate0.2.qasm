// Initial wiring: [19, 14, 10, 8, 9, 6, 13, 1, 11, 12, 15, 16, 4, 2, 18, 3, 5, 7, 0, 17]
// Resulting wiring: [19, 14, 10, 8, 9, 6, 13, 1, 11, 12, 15, 16, 4, 2, 18, 3, 5, 7, 0, 17]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[1];
cx q[8], q[7];
cx q[9], q[0];
cx q[11], q[8];
cx q[8], q[7];
cx q[7], q[6];
cx q[12], q[11];
cx q[15], q[14];
cx q[16], q[15];
cx q[18], q[12];
cx q[12], q[6];
cx q[12], q[7];
cx q[6], q[4];
cx q[18], q[12];
cx q[16], q[17];
cx q[17], q[18];
cx q[13], q[16];
cx q[12], q[13];
cx q[13], q[16];
cx q[9], q[10];
cx q[2], q[3];
