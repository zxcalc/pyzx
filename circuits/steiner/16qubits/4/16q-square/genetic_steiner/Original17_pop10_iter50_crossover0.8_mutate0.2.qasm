// Initial wiring: [7, 15, 8, 6, 9, 4, 1, 2, 10, 13, 5, 11, 12, 3, 0, 14]
// Resulting wiring: [7, 15, 8, 6, 9, 4, 1, 2, 10, 13, 5, 11, 12, 3, 0, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[4];
cx q[15], q[14];
cx q[14], q[13];
cx q[15], q[14];
cx q[5], q[6];
