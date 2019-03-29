// Initial wiring: [7, 9, 4, 13, 11, 5, 2, 8, 14, 15, 6, 0, 12, 3, 10, 1]
// Resulting wiring: [7, 9, 4, 13, 11, 5, 2, 8, 14, 15, 6, 0, 12, 3, 10, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[7], q[6];
cx q[6], q[5];
cx q[14], q[15];
cx q[9], q[14];
cx q[14], q[15];
cx q[4], q[11];
cx q[2], q[5];
cx q[1], q[6];
