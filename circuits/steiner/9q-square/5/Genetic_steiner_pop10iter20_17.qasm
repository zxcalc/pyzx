// Initial wiring: [8, 7, 0, 4, 5, 6, 3, 1, 2]
// Resulting wiring: [8, 7, 0, 4, 5, 6, 3, 1, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[2], q[3];
cx q[7], q[4];
cx q[6], q[7];
