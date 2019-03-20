// Initial wiring: [8, 5, 0, 2, 4, 3, 6, 7, 1]
// Resulting wiring: [8, 5, 0, 2, 4, 3, 6, 7, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[5], q[6];
cx q[7], q[6];
cx q[6], q[7];
cx q[7], q[4];
