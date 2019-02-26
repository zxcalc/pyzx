// Initial wiring: [5 1 2 3 0 6 4 8 7]
// Resulting wiring: [5 1 2 3 0 6 4 8 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[1], q[0];
cx q[7], q[6];
