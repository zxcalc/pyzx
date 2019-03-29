// Initial wiring: [16, 18, 7, 8, 11, 17, 19, 13, 2, 9, 4, 0, 15, 3, 5, 6, 1, 10, 12, 14]
// Resulting wiring: [16, 18, 7, 8, 11, 17, 19, 13, 2, 9, 4, 0, 15, 3, 5, 6, 1, 10, 12, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[9];
cx q[10], q[8];
cx q[13], q[12];
cx q[14], q[13];
cx q[16], q[17];
cx q[7], q[13];
cx q[2], q[3];
cx q[1], q[7];
