// Initial wiring: [0 2 1 3 5 7 6 4 8]
// Resulting wiring: [0 2 1 3 5 7 6 4 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[0];
cx q[5], q[0];
cx q[1], q[4];
