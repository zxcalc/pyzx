// Initial wiring: [7, 3, 5, 4, 1, 8, 6, 0, 2]
// Resulting wiring: [7, 3, 5, 4, 1, 8, 6, 0, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[5], q[6];
cx q[7], q[8];
cx q[5], q[4];
cx q[2], q[1];
