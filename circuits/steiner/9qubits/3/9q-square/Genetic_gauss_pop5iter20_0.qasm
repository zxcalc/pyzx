// Initial wiring: [5 4 1 3 2 0 7 8 6]
// Resulting wiring: [5 4 1 3 2 0 7 8 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[5], q[6];
cx q[7], q[4];
