// Initial wiring: [11, 7, 15, 1, 10, 14, 4, 0, 9, 13, 6, 3, 5, 12, 2, 8]
// Resulting wiring: [11, 7, 15, 1, 10, 14, 4, 0, 9, 13, 6, 3, 5, 12, 2, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[9], q[8];
cx q[12], q[11];
cx q[14], q[15];
cx q[12], q[13];
cx q[6], q[7];
cx q[4], q[11];
cx q[1], q[2];
