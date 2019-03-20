// Initial wiring: [4, 8, 3, 7, 2, 0, 6, 5, 1]
// Resulting wiring: [4, 8, 3, 7, 2, 0, 6, 5, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[5], q[6];
cx q[6], q[7];
cx q[8], q[7];
cx q[3], q[2];
