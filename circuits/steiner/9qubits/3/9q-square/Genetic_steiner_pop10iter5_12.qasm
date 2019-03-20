// Initial wiring: [8, 4, 5, 7, 0, 1, 6, 3, 2]
// Resulting wiring: [8, 4, 5, 7, 0, 1, 6, 3, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[8];
cx q[6], q[7];
cx q[1], q[0];
