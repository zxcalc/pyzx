// Initial wiring: [8, 9, 12, 10, 5, 16, 14, 13, 18, 7, 15, 0, 2, 3, 1, 4, 17, 19, 6, 11]
// Resulting wiring: [8, 9, 12, 10, 5, 16, 14, 13, 18, 7, 15, 0, 2, 3, 1, 4, 17, 19, 6, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[1];
cx q[13], q[12];
cx q[14], q[5];
cx q[16], q[14];
cx q[14], q[5];
cx q[5], q[4];
cx q[16], q[13];
cx q[17], q[16];
cx q[16], q[13];
cx q[17], q[16];
cx q[18], q[17];
cx q[17], q[18];
cx q[16], q[17];
cx q[14], q[15];
cx q[13], q[15];
cx q[10], q[11];
cx q[7], q[8];
cx q[3], q[4];
cx q[2], q[3];
cx q[3], q[4];
cx q[1], q[2];
cx q[2], q[3];
cx q[3], q[2];
