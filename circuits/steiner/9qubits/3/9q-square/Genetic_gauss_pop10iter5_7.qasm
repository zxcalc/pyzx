// Initial wiring: [5 2 1 3 4 6 0 8 7]
// Resulting wiring: [5 2 1 3 4 6 0 8 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[1], q[0];
cx q[7], q[4];
