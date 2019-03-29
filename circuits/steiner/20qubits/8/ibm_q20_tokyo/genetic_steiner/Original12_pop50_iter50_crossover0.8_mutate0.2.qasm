// Initial wiring: [13, 0, 6, 12, 15, 19, 10, 5, 18, 16, 9, 8, 3, 1, 2, 17, 7, 14, 11, 4]
// Resulting wiring: [13, 0, 6, 12, 15, 19, 10, 5, 18, 16, 9, 8, 3, 1, 2, 17, 7, 14, 11, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[8];
cx q[13], q[12];
cx q[15], q[14];
cx q[15], q[13];
cx q[16], q[17];
cx q[11], q[12];
cx q[8], q[9];
cx q[1], q[2];
