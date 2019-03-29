// Initial wiring: [14, 0, 10, 6, 8, 3, 12, 1, 5, 7, 9, 11, 4, 2, 15, 13]
// Resulting wiring: [14, 0, 10, 6, 8, 3, 12, 1, 5, 7, 9, 11, 4, 2, 15, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[9], q[6];
cx q[12], q[11];
cx q[11], q[10];
cx q[14], q[9];
cx q[9], q[6];
cx q[14], q[9];
