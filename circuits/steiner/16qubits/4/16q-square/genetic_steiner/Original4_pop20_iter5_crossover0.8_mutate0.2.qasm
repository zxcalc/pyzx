// Initial wiring: [1, 4, 14, 15, 7, 12, 0, 5, 9, 2, 10, 11, 6, 3, 13, 8]
// Resulting wiring: [1, 4, 14, 15, 7, 12, 0, 5, 9, 2, 10, 11, 6, 3, 13, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[8], q[7];
cx q[11], q[4];
cx q[14], q[13];
