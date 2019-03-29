// Initial wiring: [9, 5, 8, 2, 7, 6, 1, 11, 0, 12, 10, 13, 3, 14, 15, 4]
// Resulting wiring: [9, 5, 8, 2, 7, 6, 1, 11, 0, 12, 10, 13, 3, 14, 15, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[15], q[14];
cx q[10], q[13];
cx q[13], q[12];
