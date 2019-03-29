// Initial wiring: [7, 4, 5, 15, 2, 0, 12, 13, 3, 11, 10, 9, 14, 6, 1, 8]
// Resulting wiring: [7, 4, 5, 15, 2, 0, 12, 13, 3, 11, 10, 9, 14, 6, 1, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[13], q[12];
cx q[12], q[11];
cx q[13], q[12];
cx q[14], q[9];
cx q[9], q[6];
cx q[6], q[5];
cx q[9], q[6];
cx q[15], q[8];
cx q[4], q[11];
cx q[2], q[5];
cx q[0], q[7];
