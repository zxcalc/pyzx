// Initial wiring: [9, 6, 3, 0, 14, 1, 11, 5, 15, 13, 12, 10, 8, 2, 7, 4]
// Resulting wiring: [9, 6, 3, 0, 14, 1, 11, 5, 15, 13, 12, 10, 8, 2, 7, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[11], q[10];
cx q[9], q[14];
cx q[6], q[7];
