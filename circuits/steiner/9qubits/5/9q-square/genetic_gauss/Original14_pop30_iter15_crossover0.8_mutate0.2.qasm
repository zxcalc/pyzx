// Initial wiring: [7, 5, 2, 6, 4, 0, 1, 8, 3]
// Resulting wiring: [7, 5, 2, 6, 4, 0, 1, 8, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[0];
cx q[8], q[2];
cx q[3], q[8];
cx q[1], q[4];
cx q[1], q[3];
