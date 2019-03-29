// Initial wiring: [1, 4, 8, 15, 6, 9, 13, 2, 11, 12, 3, 5, 0, 7, 14, 10]
// Resulting wiring: [1, 4, 8, 15, 6, 9, 13, 2, 11, 12, 3, 5, 0, 7, 14, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[6], q[1];
cx q[14], q[9];
cx q[9], q[6];
cx q[6], q[1];
cx q[9], q[6];
cx q[4], q[11];
