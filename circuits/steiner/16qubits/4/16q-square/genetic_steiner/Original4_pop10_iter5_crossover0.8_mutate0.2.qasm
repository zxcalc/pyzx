// Initial wiring: [1, 3, 2, 6, 5, 14, 13, 8, 7, 12, 15, 9, 0, 10, 11, 4]
// Resulting wiring: [1, 3, 2, 6, 5, 14, 13, 8, 7, 12, 15, 9, 0, 10, 11, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[9], q[8];
cx q[10], q[5];
cx q[11], q[4];
cx q[14], q[9];
cx q[9], q[8];
cx q[14], q[9];
