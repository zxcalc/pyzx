// Initial wiring: [9, 2, 10, 17, 0, 4, 8, 12, 1, 11, 6, 19, 5, 15, 14, 3, 13, 16, 18, 7]
// Resulting wiring: [9, 2, 10, 17, 0, 4, 8, 12, 1, 11, 6, 19, 5, 15, 14, 3, 13, 16, 18, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[3];
cx q[11], q[9];
cx q[12], q[7];
cx q[14], q[13];
cx q[13], q[12];
cx q[14], q[5];
cx q[15], q[16];
