// Initial wiring: [2, 6, 4, 5, 8, 0, 7, 1, 3]
// Resulting wiring: [2, 6, 4, 5, 8, 0, 7, 1, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[7];
cx q[3], q[8];
cx q[3], q[2];
cx q[4], q[1];
cx q[5], q[0];
