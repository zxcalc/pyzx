// Initial wiring: [5, 15, 4, 16, 8, 12, 3, 13, 6, 10, 18, 11, 19, 9, 17, 14, 1, 7, 0, 2]
// Resulting wiring: [5, 15, 4, 16, 8, 12, 3, 13, 6, 10, 18, 11, 19, 9, 17, 14, 1, 7, 0, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[7];
cx q[14], q[13];
cx q[13], q[7];
cx q[15], q[16];
cx q[12], q[17];
cx q[6], q[13];
cx q[2], q[7];
cx q[1], q[8];
