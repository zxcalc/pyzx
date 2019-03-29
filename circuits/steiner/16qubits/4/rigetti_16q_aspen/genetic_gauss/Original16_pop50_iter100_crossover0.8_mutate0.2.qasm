// Initial wiring: [14, 9, 15, 0, 1, 8, 11, 7, 3, 12, 10, 13, 2, 6, 5, 4]
// Resulting wiring: [14, 9, 15, 0, 1, 8, 11, 7, 3, 12, 10, 13, 2, 6, 5, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[6];
cx q[8], q[2];
cx q[7], q[13];
cx q[4], q[12];
