// Initial wiring: [6, 11, 0, 1, 4, 7, 10, 14, 3, 2, 8, 15, 13, 5, 12, 9]
// Resulting wiring: [6, 11, 0, 1, 4, 7, 10, 14, 3, 2, 8, 15, 13, 5, 12, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[0];
cx q[10], q[9];
cx q[10], q[6];
cx q[11], q[3];
cx q[14], q[0];
cx q[8], q[13];
cx q[3], q[8];
cx q[0], q[7];
