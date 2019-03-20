// Initial wiring: [7, 0, 5, 3, 4, 6, 2, 8, 1]
// Resulting wiring: [7, 0, 5, 3, 4, 6, 2, 8, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[1], q[4];
cx q[3], q[8];
cx q[8], q[3];
cx q[3], q[2];
cx q[8], q[3];
