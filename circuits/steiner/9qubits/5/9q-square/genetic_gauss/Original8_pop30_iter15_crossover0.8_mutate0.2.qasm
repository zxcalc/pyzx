// Initial wiring: [3, 0, 5, 8, 2, 6, 4, 7, 1]
// Resulting wiring: [3, 0, 5, 8, 2, 6, 4, 7, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[2];
cx q[7], q[3];
cx q[3], q[4];
cx q[0], q[3];
cx q[1], q[6];
