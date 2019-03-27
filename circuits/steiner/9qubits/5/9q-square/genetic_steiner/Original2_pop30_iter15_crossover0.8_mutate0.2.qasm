// Initial wiring: [4, 7, 5, 1, 8, 0, 6, 3, 2]
// Resulting wiring: [4, 7, 5, 1, 8, 0, 6, 3, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[7];
cx q[3], q[8];
cx q[3], q[4];
cx q[4], q[3];
