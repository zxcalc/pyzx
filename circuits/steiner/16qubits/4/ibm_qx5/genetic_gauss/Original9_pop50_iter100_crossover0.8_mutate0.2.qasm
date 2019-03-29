// Initial wiring: [14, 9, 5, 2, 15, 6, 0, 7, 3, 1, 13, 11, 10, 4, 12, 8]
// Resulting wiring: [14, 9, 5, 2, 15, 6, 0, 7, 3, 1, 13, 11, 10, 4, 12, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[3];
cx q[10], q[5];
cx q[14], q[7];
cx q[3], q[15];
