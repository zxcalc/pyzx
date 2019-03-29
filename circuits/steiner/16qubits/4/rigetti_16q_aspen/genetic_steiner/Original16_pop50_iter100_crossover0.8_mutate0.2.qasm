// Initial wiring: [0, 9, 8, 12, 4, 10, 14, 6, 7, 3, 15, 1, 2, 5, 11, 13]
// Resulting wiring: [0, 9, 8, 12, 4, 10, 14, 6, 7, 3, 15, 1, 2, 5, 11, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[15], q[14];
cx q[11], q[12];
cx q[9], q[10];
