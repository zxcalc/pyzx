// Initial wiring: [7, 3, 0, 6, 1, 4, 8, 5, 2]
// Resulting wiring: [7, 3, 0, 6, 1, 4, 8, 5, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[6];
cx q[7], q[6];
cx q[5], q[0];
