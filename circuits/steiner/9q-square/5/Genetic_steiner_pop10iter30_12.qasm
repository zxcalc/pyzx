// Initial wiring: [5, 0, 3, 7, 8, 4, 6, 2, 1]
// Resulting wiring: [5, 0, 3, 7, 8, 4, 6, 2, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[6], q[7];
cx q[4], q[7];
cx q[7], q[8];
cx q[6], q[7];
cx q[5], q[6];
cx q[7], q[8];
cx q[5], q[0];
