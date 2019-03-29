// Initial wiring: [0, 4, 9, 1, 7, 15, 10, 3, 6, 13, 5, 12, 11, 14, 2, 8]
// Resulting wiring: [0, 4, 9, 1, 7, 15, 10, 3, 6, 13, 5, 12, 11, 14, 2, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[9], q[8];
cx q[14], q[9];
cx q[9], q[8];
cx q[14], q[15];
cx q[8], q[9];
cx q[7], q[8];
cx q[8], q[15];
cx q[6], q[7];
cx q[7], q[8];
cx q[4], q[5];
cx q[3], q[4];
cx q[4], q[11];
