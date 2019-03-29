// Initial wiring: [8, 2, 13, 10, 1, 5, 7, 6, 0, 3, 14, 4, 11, 9, 15, 12]
// Resulting wiring: [8, 2, 13, 10, 1, 5, 7, 6, 0, 3, 14, 4, 11, 9, 15, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[14], q[15];
cx q[11], q[12];
cx q[12], q[13];
