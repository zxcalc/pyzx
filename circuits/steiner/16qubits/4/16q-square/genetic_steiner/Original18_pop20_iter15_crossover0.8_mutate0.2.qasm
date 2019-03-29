// Initial wiring: [5, 10, 11, 14, 6, 2, 15, 7, 4, 9, 1, 8, 13, 3, 12, 0]
// Resulting wiring: [5, 10, 11, 14, 6, 2, 15, 7, 4, 9, 1, 8, 13, 3, 12, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[9];
cx q[9], q[6];
cx q[11], q[12];
cx q[6], q[9];
cx q[9], q[14];
cx q[5], q[6];
cx q[6], q[9];
cx q[9], q[6];
