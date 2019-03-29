// Initial wiring: [3, 9, 11, 4, 2, 0, 6, 12, 13, 14, 5, 10, 7, 1, 15, 8]
// Resulting wiring: [3, 9, 11, 4, 2, 0, 6, 12, 13, 14, 5, 10, 7, 1, 15, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[10], q[5];
cx q[12], q[11];
cx q[14], q[15];
cx q[6], q[9];
cx q[4], q[5];
cx q[0], q[7];
cx q[7], q[6];
cx q[6], q[9];
cx q[9], q[6];
