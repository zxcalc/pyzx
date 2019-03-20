// Initial wiring: [5, 7, 4, 8, 2, 0, 6, 3, 1]
// Resulting wiring: [5, 7, 4, 8, 2, 0, 6, 3, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[3], q[8];
cx q[7], q[6];
cx q[4], q[3];
cx q[7], q[4];
