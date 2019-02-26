// Initial wiring: [1, 4, 3, 7, 5, 2, 6, 0, 8]
// Resulting wiring: [1, 4, 3, 7, 5, 2, 6, 0, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[1], q[4];
cx q[6], q[7];
