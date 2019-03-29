// Initial wiring: [5, 9, 19, 6, 11, 2, 3, 18, 10, 17, 15, 0, 4, 16, 13, 8, 14, 1, 12, 7]
// Resulting wiring: [5, 9, 19, 6, 11, 2, 3, 18, 10, 17, 15, 0, 4, 16, 13, 8, 14, 1, 12, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[6];
cx q[9], q[8];
cx q[11], q[17];
cx q[7], q[13];
cx q[13], q[16];
cx q[6], q[12];
cx q[2], q[3];
cx q[3], q[4];
